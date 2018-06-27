class Cart

  PRICE = 100

  def add(items)
    @ordered_items = items.map{ |key, value| value } #將資料轉換為陣列後，刪除客戶沒有買的哈利波特集數
  end

  def calculate
    total = 0
    @ordered_items = @ordered_items.delete_if{ |i| i == 0 }

    while @ordered_items.size > 0 # 當客戶還有書籍尚未結帳時
      if @ordered_items.size == 5
        total = total + 5 * PRICE * 0.75 # 客戶買了五集哈利波特
      elsif @ordered_items.size == 4
        total = total + 4 * PRICE * 0.80 # 客戶買了四集哈利波特
      elsif @ordered_items.size == 3
        total = total + 3 * PRICE * 0.90 # 客戶買了三集哈利波特
      elsif @ordered_items.size == 2
        total = total + 2 * PRICE * 0.95 # 客戶買了兩集哈利波特
      else
        total = total + PRICE # 客戶買了單一本哈利波特
      end
      @ordered_items = @ordered_items.map { |i| i -= 1 } # 刪除已計算過的書籍
      @ordered_items = @ordered_items.delete_if{ |i| i == 0 } # 把已經結完的集數刪除
    end

    return total
  end

end
