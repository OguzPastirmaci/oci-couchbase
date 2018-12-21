resource "oci_core_volume" "dataBlock" {
  count               = "${oci_core_instance.data.count * var.NumIscsiVolumesPerInstance}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "dataBlock${count.index}"
  size_in_gbs         = "${var.block_size}"
}

resource "oci_core_volume_attachment" "dataBlockAttach" {
  count           = "${oci_core_instance.data.count * var.NumIscsiVolumesPerInstance}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.data.*.id[count.index / var.NumIscsiVolumesPerInstance]}"
  volume_id       = "${oci_core_volume.dataBlock.*.id[count.index]}"
}

resource "oci_core_volume" "indexqueryBlock" {
  count               = "${oci_core_instance.indexquery.count * var.NumIscsiVolumesPerInstance}"
  availability_domain = "${var.availability_domain}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "indexqueryBlock${count.index}"
  size_in_gbs         = "${var.block_size}"
}

resource "oci_core_volume_attachment" "indexqueryBlockAttach" {
  count           = "${oci_core_instance.indexquery.count * var.NumIscsiVolumesPerInstance}"
  attachment_type = "iscsi"
  compartment_id  = "${var.compartment_ocid}"
  instance_id     = "${oci_core_instance.indexquery.*.id[count.index / var.NumIscsiVolumesPerInstance]}"
  volume_id       = "${oci_core_volume.indexqueryBlock.*.id[count.index]}"
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