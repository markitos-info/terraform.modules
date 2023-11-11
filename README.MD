Semantica para el nombre,titulo de los bloques de los modulos

============================================================
para variables
============================================================
variable "markitos_module_aws_ec2_ami_image" {
description = "ec2 ami image"
type = string
nullable = false
}

markitos_module_aws_ec2_ami_image
^^^^^^^^^^^^^^^^-^^^^^^^^^
markitos_module_resource------var-reason
============================================================

============================================================
para resources
============================================================
resource "aws_instance" "aws_instance_markitos_module" {
ami = var.markitos_ec2_ami
instance_type = var.markitos_ec2_type
tags = var.markitos_ec2_common_tags
}

aws_instance_markitos_module_extradata
^^^^^^^^^^^^^^^^^^^^^^^^^^^^-^^^^^^^^^
block title-----------------optionally
============================================================

============================================================
para outputs
============================================================
output "output_aws_instance_markitos_module_public_ip" {
value = aws_instance.aws_instance_markitos_module.public_ip
}

output_aws_instance_markitos_module_public_ip
^^^^^^-^^^^^^^^^^^^^^^^^^^^^^^^^^^^-^^^^^^^
block------------block title-----output reason
============================================================
