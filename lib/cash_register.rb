require 'pry'


class CashRegister
    attr_accessor :total, :discount, :item

    def initialize(discount=0)
        
        @total = 0
        # binding.pry 
        @discount = discount
        @item = []
    end
    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do 
            item << {title: title, price: price, quantity: quantity}
        end

    end
    
    def apply_discount
        #binding.pry
        if self.discount > 0
           # binding.pry
    
        self.total = self.total * (100-self.discount)/100
        #self.total = self.total.to_i
        self.discount = 0
        "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def items
        self.item.map { |item| item[:title]}
        
    end
    # void_last_transaction
    # subtracts the last item from the total (FAILED - 2)
    # returns the total to 0.0 if all items have been removed (FAILED - 3)
    # def void_last_transaction
    #     binding.pry
    # end
    def void_last_transaction
        #binding.pry
        # item[:quantity].times do
        # returned_item = self.item.pop()
        # self.total = self.total - returned_item[:price]
        # # if self.item.length = 0
        # #     self.total
        # end

        returned_item = self.item.pop()

        returned_item[:quantity].times do
            self.total -= returned_item[:price]
        end
        
    end
end