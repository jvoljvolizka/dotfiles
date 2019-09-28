# Defined in - @ line 1
function vmwnetwork --description 'alias vmwnetwork systemctl start vmware-networks.service'
	systemctl start vmware-networks.service $argv;
end
