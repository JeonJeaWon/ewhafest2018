class Fest < ActiveRecord::Base
    serialize :detail,Array
    
    require 'csv'
    
    def self.import(file)
        CSV.foreach(file.path, headers: true, encoding: 'r:iso-8859-1:utf-8') do |row|
            
            info_hash=row.to_hash
            
            detail_temp=info_hash["detail"]
            
            if detail_temp
             detail_temp=detail_temp.split(",")
            end
            
            info_hash["detail"]=detail_temp
            #info=Fest.where(id: info_hash["detail"])
            # info=info.split(",")
            # info.update_attributes(info_hash)
            
            #info_hash["detail"].gsub!('"', '')
           Fest.create! (info_hash)
        end
    end
end
