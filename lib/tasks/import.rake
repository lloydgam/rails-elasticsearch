require 'open-uri'
require 'csv'
url =  "http://www.mbsonline.gov.au/internet/mbsonline/publishing.nsf/Content/1BC94358D4F276D3CA257CCF0000AA73/$File/20220701_MBSONLINE_DESC_out.03.06.22.TXT"

desc "Imports a CSV file into an ActiveRecord table"
task :import, [:filename] => :environment do    
  download = open(url)
  IO.copy_stream(download, 'import_mbs_item.csv')
  tsv = CsvParser.new('import_mbs_item.csv')
  tsv.parse do |row|
    MbsItem.create(reference: row["ITEM"], 
      start_date: row["DESCRIPTION_START"],
      end_date: row["DESCRIPTION_END"],
      description: row["Description"],
      is_latest: row["LATEST"],
    )
  end
end