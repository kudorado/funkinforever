package;

class ItemData
{
    public var name:String;
    public var cost:Int;

	public function new(
    data:
    {
        name:String,
        cost:Int
    })
	{
        this.name = data.name;
        this.cost = data.cost;
    }
}