resource "oci_core_volume" "group1Block" {
  count               = "${oci_core_instance.group1.count * var.NumIscsiVolumesPerInstance}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "group1Block${count.index}"
  size_in_gbs         = "${var.block_size}"
}

resource "oci_core_volume_attachment" "group1BlockAttach" {
  count           = "${oci_core_instance.group1.count * var.NumIscsiVolumesPerInstance}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.group1.*.id[count.index / var.NumIscsiVolumesPerInstance]}"
  volume_id       = "${oci_core_volume.group1Block.*.id[count.index]}"
}

resource "oci_core_volume" "group2Block" {
  count               = "${oci_core_instance.group2.count * var.NumIscsiVolumesPerInstance}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "group2Block${count.index}"
  size_in_gbs         = "${var.block_size}"
}

resource "oci_core_volume_attachment" "group2BlockAttach" {
  count           = "${oci_core_instance.group2.count * var.NumIscsiVolumesPerInstance}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.group2.*.id[count.index / var.NumIscsiVolumesPerInstance]}"
  volume_id       = "${oci_core_volume.group2Block.*.id[count.index]}"
}

resource "oci_core_volume" "group3Block" {
  count               = "${oci_core_instance.group3.count * var.NumIscsiVolumesPerInstance}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "group3Block${count.index}"
  size_in_gbs         = "${var.block_size}"
}

resource "oci_core_volume_attachment" "group3BlockAttach" {
  count           = "${oci_core_instance.group3.count * var.NumIscsiVolumesPerInstance}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.group3.*.id[count.index / var.NumIscsiVolumesPerInstance]}"
  volume_id       = "${oci_core_volume.group3Block.*.id[count.index]}"
}