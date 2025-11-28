function InventoryScript() constructor{
	
	_inventory = [];
	_max_inventory_item =7;
	
	add = function(_someSprite,_someName,_someObject) {
	if(array_length(_inventory) < _max_inventory_item){
		array_push(_inventory,{
		sprite: _someSprite,
		name: _someName,
		object: _someObject,
		hover : false,
		})
	}
}