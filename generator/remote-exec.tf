resource "null_resource" "remote-exec-group1" {
  depends_on = ["oci_core_instance.group1", "oci_core_volume_attachment.group1BlockAttach"]
  count      = "${oci_core_instance.group1.count * var.NumIscsiVolumesPerInstance}"

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.group1.*.public_ip[count.index % oci_core_instance.group1.count]}"
      user        = "opc"
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "touch ~/IMadeAFile.Right.Here",
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.group1BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group1BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group1BlockAttach.*.port[count.index]}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.group1BlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.group1BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group1BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group1BlockAttach.*.port[count.index]} -l >> ~/.bashrc",
    ]
  }
}

resource "null_resource" "remote-exec-group2" {
  depends_on = ["oci_core_instance.group2", "oci_core_volume_attachment.group2BlockAttach"]
  count      = "${oci_core_instance.group2.count * var.NumIscsiVolumesPerInstance}"

  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.group2.*.public_ip[count.index % oci_core_instance.group2.count]}"
      user        = "opc"
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "touch ~/IMadeAFile.Right.Here",
      "sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.group2BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group2BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group2BlockAttach.*.port[count.index]}",
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.group2BlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.group2BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group2BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group2BlockAttach.*.port[count.index]} -l >> ~/.bashrc",
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
      "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.group1BlockAttach.*.iqn[count.index]} -n node.startup -v automatic",
      "echo sudo iscsiadm -m node -T ${oci_core_volume_attachment.group3BlockAttach.*.iqn[count.index]} -p ${oci_core_volume_attachment.group3BlockAttach.*.ipv4[count.index]}:${oci_core_volume_attachment.group3BlockAttach.*.port[count.index]} -l >> ~/.bashrc",
    ]
  }
}