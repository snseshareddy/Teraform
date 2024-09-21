## Iterate Set using count

#Step 1: Create a set
variable "my_set" {
   type    = set(string)
   default = ["value1", "value2", "value3"]
}

#Step 2: Convert set to list
locals {
   my_list = tolist(var.my_set)
}

#Step 3: Use count to iterate
resource "my_resource" "example" {
   count = length(local.my_list)

   name = local.my_list[count.index]
   # Additional resource configuration...

#-----------------------------------------------------------------------------------------------------------

### Iterate map using count
## Step 1: Create a map variable
variable "my_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

## Step 2: Fetch keys of map
locals {
  my_keys = keys(var.my_map)
}

## Step 3: iterate over map using keys and count.index meta argument
resource "my_resource" "example" {
  count = length(local.my_keys)

  name  = local.my_keys[count.index]
  value = var.my_map[local.my_keys[count.index]]
  # Additional resource configuration...
}
######--------------------------------------------------------------------------------------------------------------

## Loops with for_each ###  Note : - It can only be used on set(string) or map(string). 
### why for_each does not work on list(string) is because a list can contain duplicate values

### Iterate List using for_each

#Step 1: Create a list varible
variable "my_list" {
   type    = list(string)
   default = ["value1", "value2", "value3"]
}

resource "my_resource" "example" {
   
   #Step 2: Convert list to set using toset() function 
   for_each = toset(var.my_list)

   #Step 3: Iterate over the list
   name = each.value
   # Additional resource configuration...
}

#### --------------------------------------------------------------------------------------------------------------------

### Iterate Set using for_each

variable "user_names" {
  description = "IAM usernames"
  type        = set(string)
  default     = ["user1", "user2", "user3s"]
} 

resource "my_resource" "example"{

    for_each = var.user_names
    name = each.value

}

#### --------------------------------------------------------------------------------------------------------------------

### Iterate map using for_each

#Step 1: Create a map 
variable "my_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}

#Step 2: Iterate over the map using for_each
resource "my_resource" "example" {
  for_each = var.my_map

  name  = each.key
  value = each.value
  # Additional resource configuration...
}

#### --------------------------------------------------------------------------------------------------------------------

## How to iterate over Set using for loop works on list

#Step 1: Create a set
variable "my_set" {
  type    = set(string)
  default = ["value1", "value2", "value3"]
}

#Step 2: Conver it to the list
locals {
  my_list = tolist(var.my_set)
}

#Step 3: Use for loop
resource "my_resource" "example" {
  for_each = { for idx, value in local.my_list : idx => value }

  name = each.value
  # Additional resource configuration...
} 

#### --------------------------------------------------------------------------------------------------------------------

## How to iterate over List using for loop
variable "user_names" {
  description = "IAM usernames"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
} 

resource "my_resource" "example" {
    value = [for name in var.user_names : name]
}

#### ------------------------------------------------------------------------------------------------------------------------

## How to iterate over MAP using for?
variable "iam_users" {
  description = "map"
  type        = map(string)
  default     = {
    user1      = "normal user"
    user2  = "admin user"
    user3 = "root user"
  }
}

output "user_with_roles" {
  value = [for name, role in var.iam_users : "${name} is the ${role}"]
}

#### ----------------------------------------------------------------------------------------------------------------------