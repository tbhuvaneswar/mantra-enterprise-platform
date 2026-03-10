locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  image_name = "mantra-base-${var.image_version}-${local.timestamp}"
}
