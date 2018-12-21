resource "null_resource" "remote-exec-data" {
  depends_on = ["oci_core_instance.data", "oci_core_volume_attachment.dataBlockAttach"]
  count      = "${oci_core_instance.data.count * var.NumIscsiVolumesPerInstance}"

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.data.*.public_ip[count.index % oci_core_instance.data.count]}"
      user        = "opc"
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "touch ~/IMadeAFile.Right.Here",
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.dataBlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.dataBlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.dataBlockAttach.*.port[count.index]}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.dataBlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.dataBlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.dataBlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.dataBlockAttach.*.port[count.index]} -l >> ~/.bashrc",
    ]
  }
}

resource "null_resource" "remote-exec-indexquery" {
  depends_on = ["oci_core_instance.indexquery", "oci_core_volume_attachment.indexqueryBlockAttach"]
  count      = "${oci_core_instance.indexquery.count * var.NumIscsiVolumesPerInstance}"

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.indexquery.*.public_ip[count.index % oci_core_instance.indexquery.count]}"
      user        = "opc"
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "touch ~/IMadeAFile.Right.Here",
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.indexqueryBlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.indexqueryBlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.indexqueryBlockAttach.*.port[count.index]}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.indexqueryBlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.indexqueryBlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.indexqueryBlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.indexqueryBlockAttach.*.port[count.index]} -l >> ~/.bashrc",
    ]
  }
}

resource "null_resource" "remote-exec-group3" {
  depends_on = ["oci_core_instance.group3", "oci_core_volume_attachment.group3BlockAttach"]
  count      = "${oci_core_instance.group3.count * var.NumIscsiVolumesPerInstance}"

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.group3.*.public_ip[count.index % oci_core_instance.group3.count]}"
      user        = "opc"
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "touch ~/IMadeAFile.Right.Here",
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.group3BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group3BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group3BlockAttach.*.port[count.index]}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.group3BlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.group3BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group3BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group3BlockAttach.*.port[count.index]} -l >> ~/.bashrc",
    ]
  }
}