# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    @{
        package = 'easy-rsa'
        package_version = '3.1.5-r0'
        distro = 'alpine'
        distro_version = 'edge'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.1.2-r0'
        distro = 'alpine'
        distro_version = '3.18'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.1.1-r0'
        distro = 'alpine'
        distro_version = '3.17'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.8-r0'
        distro = 'alpine'
        distro_version = '3.13'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.7-r0'
        distro = 'alpine'
        distro_version = '3.12'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.6-r0'
        distro = 'alpine'
        distro_version = '3.11'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.6-r0'
        distro = 'alpine'
        distro_version = '3.10'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.5-r0'
        distro = 'alpine'
        distro_version = '3.9'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.4-r0'
        distro = 'alpine'
        distro_version = '3.8'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.3-r0'
        distro = 'alpine'
        distro_version = '3.7'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.1-r0'
        distro = 'alpine'
        distro_version = '3.6'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.1-r0'
        distro = 'alpine'
        distro_version = '3.5'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.1-r0'
        distro = 'alpine'
        distro_version = '3.4'
        subvariants = @(
            @{ components = @() }
        )
    }
    @{
        package = 'easy-rsa'
        package_version = '3.0.1-r0'
        distro = 'alpine'
        distro_version = '3.3'
        subvariants = @(
            @{ components = @() }
        )
    }
)

$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    package = $variant['package']
                    package_version = $variant['package_version']
                    package_version_semver = "v$( $variant['package_version'] )" -replace '-r\d+', ''   # E.g. Strip out the '-r' in '2.3.0.0-r1'
                    distro = $variant['distro']
                    distro_version = $variant['distro_version']
                    platforms = & {
                        if ($variant['distro'] -eq 'alpine') {
                            if ($variant['distro_version'] -in @( '3.3', '3.4', '3.5' ) ) {
                              'linux/amd64'
                            }else {
                              'linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/s390x'
                            }
                        }
                    }
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. 'v2.3.0-alpine-3.6'
                tag = @(
                        "v$( $variant['package_version'] )" -replace '-r\d+', ''    # E.g. Strip out the '-r' in '2.3.0.0-r1'
                        $subVariant['components'] | ? { $_ }
                        $variant['distro']
                        $variant['distro_version']
                ) -join '-'
                tag_as_latest = if ($variant['package_version'] -eq $local:VARIANTS_MATRIX[0]['package_version'] -and $subVariant['components'].Count -eq 0) { $true } else { $false }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
            'docker-entrypoint.sh' = @{
                common = $true
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
            'docker-compose.yml' = @{
                common = $true
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
