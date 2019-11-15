concurrent = ${runners_concurrent}
check_interval = 0

[[runners]]
  name = "${runners_name}"
  url = "${gitlab_url}"
  token = "${runners_token}"
  executor = "${runners_executor}"
  environment = ${runners_environment_vars}
  pre_build_script = "${runners_pre_build_script}"
  post_build_script = "${runners_post_build_script}"
  pre_clone_script = "${runners_pre_clone_script}"
  request_concurrency = ${runners_request_concurrency}
  output_limit = ${runners_output_limit}
  limit = ${runners_limit}
  [runners.docker]
    tls_verify = false
    image = "${runners_image}"
    privileged = ${runners_privileged}
    disable_cache = false
    volumes = ["/cache"]
    shm_size = ${runners_shm_size}
    pull_policy = "${runners_pull_policy}"
  [runners.cache]
    Type = "s3"
    Shared = ${shared_cache}
    [runners.cache.s3]
      ServerAddress = "s3.amazonaws.com"
      BucketName = "${bucket_name}"
      BucketLocation = "${aws_region}"
      Insecure = false
  [runners.machine]
    IdleCount = ${runners_idle_count}
    IdleTime = ${runners_idle_time}
    MachineDriver = "${machine_driver}"
    MachineName = "runner-%s"
    MachineOptions = [
      ${docker_machine_options}
    ]
    OffPeakTimezone = "${runners_off_peak_timezone}"
    OffPeakIdleCount = ${runners_off_peak_idle_count}
    OffPeakIdleTime = ${runners_off_peak_idle_time}
    ${runners_off_peak_periods_string}
