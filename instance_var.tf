resource "aws_key_pair" "dove-key" {
  key_name   = "dovekey-new"
  public_key = file("dovekey-new.pub")
}

resource "aws_instance" "dove-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.dove-key.key_name
  vpc_security_group_ids = ["sg-0ba6e2ef98cdacf30"]
  tags = {
    Name = "Dove-Instance"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"

    connection {
      type        = "ssh"
      user        = var.USER
      private_key = file("dovekey-new")
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "sleep 180"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Checking /tmp directory:'",
      "ls -l /tmp",
      "echo 'Contents of web.sh:'",
      "cat /tmp/web.sh",
      "chmod +x /tmp/web.sh",
      "sudo chown root:root /tmp/web.sh",
      "sudo /bin/bash /tmp/web.sh"
    ]

    connection {
      type        = "ssh"
      user        = var.USER
      private_key = file("dovekey-new")
      host        = self.public_ip
    }
  }
}

