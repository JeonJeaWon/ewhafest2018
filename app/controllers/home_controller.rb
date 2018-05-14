class HomeController < ApplicationController
  
  def index
  end

  def first
    if params[:place]
      @building=params[:place]
    else
      @building = "hak"
    end
    
    @num = 1
    
  end

  def second
    if params[:place]
      @building=params[:place]
    else
      @building = "hak"
    end
    
    @num = 1
    
  end

  def third
    if params[:place]
      @building=params[:place]
    else
      @building = "hak"
    end
    
    @num = 1
    
  end
  
  def fourth
    if params[:place]
      @building=params[:place]
    else
      @building = "hak"
    end
    
    @num = 1
  end
  
  def event
    
  end
  
  
  def pass
    
    day = Time.zone.now().to_s[8..9]
    hour = Time.zone.now().to_s[11..12].to_i
    
    case day.to_i
      when 15
        if(hour==18 || hour>18)
          @date = 4
        else
          @date = 1
        end
      when 16
        @date = 2
      when 17
        @date = 3
    end
    
    @row = Fest.where(password: params[:pass]).where(date: @date)
    if !(Fest.where(password: params[:pass]).empty?)
        if(@row.first.sold_out == 1)
          @row.first.sold_out = 0
        else
          @row.first.sold_out = 1
        end
        @row.first.save
    end
    
    redirect_to :back
    

  end
  
  def search
    @fests = Fest.all
    
  end
  
  
  
  require 'csv'
  
  def csvsave
    
        csv_text = File.read('./app/controllers/festdata.csv', :encoding =>'EUC-KR', :headers => true)
        keys = ['date', 'place', 'booth_num', 'name', 'sold_out', 'password', 'detail']
        @kk = CSV.parse(csv_text).map {|a| Hash[ keys.zip(a) ]}
        i=1
        
        while @kk[i].to_a[0][1] != '888888'
          @fest = Fest.new
          @fest.date = @kk[i].to_a[0][1]
          @fest.place = @kk[i].to_a[1][1]
          @fest.booth_num = @kk[i].to_a[2][1]
          @fest.name = @kk[i].to_a[3][1]
          @fest.sold_out = @kk[i].to_a[4][1]
          @fest.password = @kk[i].to_a[5][1]
          @fest.detail = @kk[i].to_a[6][1]
          @fest.save
          i=i + 1
        end
        redirect_to '/'
  end

    
end
