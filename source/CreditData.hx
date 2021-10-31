package;

class CreditData 
{
	public var titles:Array<String>;
	public var peopleWhoWeAppreciated:Array<String>;

	public function new(
		data:
		{
			titles:Array<String>, 
			peopleWhoWeAppreciated:Array<String>
		})
	{
		this.titles = data.titles;
		this.peopleWhoWeAppreciated = data.peopleWhoWeAppreciated;
	}
}
