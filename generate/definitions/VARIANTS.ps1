$local:VERSIONS = @( Get-Content $PSScriptRoot/versions.json -Encoding utf8 -raw | ConvertFrom-Json )

# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    foreach ($v in $local:VERSIONS) {
        @{
            package = 'easy-rsa'
            package_version = $v
            distro = 'alpine'
            distro_version = '3.17'
            subvariants = @(
                @{ components = @() }
            )
        }
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
                # Docker image tag. E.g. 'v3.0.0'
                tag = @(
                        "v$( $variant['package_version'] )"
                        $subVariant['components'] | ? { $_ }
                        # $variant['distro']
                        # $variant['distro_version']
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
