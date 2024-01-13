#/bin/sh

ansible -i ./inventory -m user -a "name=bob state=present" all
ansible -i ./inventory -m user -a "name=alice1 state=present" all
ansible -i ./inventory -m user -a "name=john state=present" all
