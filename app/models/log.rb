class Log < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  def self.monthly_rental_trend
    find_by_sql(["
      SELECT 
          TO_CHAR(created_at, 'Mon' ) AS rental_date, 
          TO_CHAR(created_at, 'MM' ) AS rental_month, 
          COUNT(logs.id) AS rental_count
      FROM logs 
      GROUP BY rental_month, rental_date
      ORDER BY rental_month
      "])
  end 

  def self.yearly_rental_trend 
    find_by_sql(["
        SELECT 
            TO_CHAR(created_at, 'Mon-YY') AS rental_date , 
            TO_CHAR(created_at, 'MM') AS rental_month, 
              TO_CHAR(created_at, 'YYYY') AS rental_year,
              COUNT(id) AS rental_count
        FROM logs 
        GROUP BY rental_date, rental_month, rental_year
        ORDER BY rental_month, rental_year
      "])
  end 
end
