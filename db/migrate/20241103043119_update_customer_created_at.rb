class UpdateCustomerCreatedAt < ActiveRecord::Migration[7.0]
  def up
    start_date = Date.new(2024, 9, 25)
    end_date = Date.new(2024, 11, 3)
    
    # Tạo một hash với số lượng khách hàng muốn tạo cho từng ngày
    daily_counts = {
      '2024-09-25' => 5,
      '2024-09-26' => 10,
      '2024-09-27' => 8,
      '2024-09-28' => 4,
      '2024-09-29' => 7,
      '2024-09-30' => 6,
      '2024-10-01' => 3,
      '2024-10-02' => 2,
      '2024-10-03' => 9,
      '2024-10-04' => 5,
      '2024-10-05' => 7,
      '2024-10-06' => 4,
      '2024-10-07' => 6,
      '2024-10-08' => 3,
      '2024-10-09' => 8,
      '2024-10-10' => 5,
      '2024-10-11' => 10,
      '2024-10-12' => 4,
      '2024-10-13' => 6,
      '2024-10-14' => 7,
      '2024-10-15' => 8,
      '2024-10-16' => 5,
      '2024-10-17' => 6,
      '2024-10-18' => 4,
      '2024-10-19' => 3,
      '2024-10-20' => 5,
      '2024-10-21' => 7,
      '2024-10-22' => 9,
      '2024-10-23' => 6,
      '2024-10-24' => 5,
      '2024-10-25' => 4,
      '2024-10-26' => 10,
      '2024-10-27' => 8,
      '2024-10-28' => 6,
      '2024-10-29' => 3,
      '2024-10-30' => 5,
      '2024-10-31' => 7,
      '2024-11-01' => 2,
      '2024-11-02' => 9,
      '2024-11-03' => 4,
    }

    daily_counts.each do |date, count|
      count.times do
        Customer.create(
          first_name: "FirstName #{SecureRandom.hex(3)}",
          last_name: "LastName #{SecureRandom.hex(3)}",
          email: "email#{SecureRandom.hex(5)}@example.com",
          phone_number: "0123456789",
          created_at: DateTime.parse(date)
        )
      end
    end
  end

  def down
    # Xóa tất cả khách hàng đã tạo trong migration này nếu cần
    Customer.where(created_at: '2024-09-25'..'2024-11-03').delete_all
  end
end
