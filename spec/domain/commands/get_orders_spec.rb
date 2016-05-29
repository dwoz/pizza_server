require "rails_helper"

RSpec.describe Commands::GetOrders do
  subject { described_class.new }
  let(:pizza) { Commands::CreatePizza.new.call(
  	pizza: { 
      "name"        => "Sicilian",
      "description" => "Thick Crust",
      'price'       => 5.0,
      "toppings"    => ["mushrooms", "corn husks"]
  })}
  
  let(:order_attributes) {
  	{ 'items' => [{'pizza' => pizza, 'quantity' => 5, 'price' => 3.0}] }
  }

  let!(:order) { Commands::CreateOrder.new.call(order: order_attributes) }

  describe '#call' do
  	it 'gets an order' do
  	  expect(subject.call).to eq [order]
  	end
  end
end
