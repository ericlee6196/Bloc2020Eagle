task scrape: :environment do
  puts 'HERE'

  require 'open-uri' 

  postings = HTTParty.get('https://www.themuse.com/api/public/jobs?category=Data%20Science&category=Engineering&category=Project%20%26%20Product%20Management&level=Entry%20Level&level=Internship&page=2',:headers =>{'Content-Type' => 'application/json'} )

    postings["results"].each do |tip|
      job_title = tip["name"]
      location = tip["locations"][0]["name"]
      url = tip["refs"]["landing_page"]
      company = tip["company"]["name"]
      level = tip["levels"][0]["name"]


    # skip persisting job if it already exists in db
    if Job.where(job_title:job_title, location:location, url:url, company:company, level:level).count <= 0
      Job.create(
        job_title:job_title,
        location:location,
        url:url, 
	company:company,
	level:level)

      puts 'Added: ' + (job_title ? job_title : '')
    else
      puts 'Skipped: ' + (job_title ? job_title : '')
    end

  end
end