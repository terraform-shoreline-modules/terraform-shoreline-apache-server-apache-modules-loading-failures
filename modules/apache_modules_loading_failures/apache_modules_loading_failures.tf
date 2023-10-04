resource "shoreline_notebook" "apache_modules_loading_failures" {
  name       = "apache_modules_loading_failures"
  data       = file("${path.module}/data/apache_modules_loading_failures.json")
  depends_on = [shoreline_action.invoke_stop_remove_clean_install_start_apache]
}

resource "shoreline_file" "stop_remove_clean_install_start_apache" {
  name             = "stop_remove_clean_install_start_apache"
  input_file       = "${path.module}/data/stop_remove_clean_install_start_apache.sh"
  md5              = filemd5("${path.module}/data/stop_remove_clean_install_start_apache.sh")
  description      = "Consider reinstalling or upgrading the Apache server to ensure that the modules are installed correctly."
  destination_path = "/agent/scripts/stop_remove_clean_install_start_apache.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_stop_remove_clean_install_start_apache" {
  name        = "invoke_stop_remove_clean_install_start_apache"
  description = "Consider reinstalling or upgrading the Apache server to ensure that the modules are installed correctly."
  command     = "`chmod +x /agent/scripts/stop_remove_clean_install_start_apache.sh && /agent/scripts/stop_remove_clean_install_start_apache.sh`"
  params      = []
  file_deps   = ["stop_remove_clean_install_start_apache"]
  enabled     = true
  depends_on  = [shoreline_file.stop_remove_clean_install_start_apache]
}

