USER_FIELD = %w(name email dob mobile salary highest_education gender address city_id state_id profession_id)
REQUIRED_USER_FIELD = %w(name email dob mobile salary highest_education gender address)
GENDER = {"Male": 0,"Female": 1,"Other": 3}.with_indifferent_access
HIGHEST_EDUCATION = {0=>"BL/LLB",1=>"M.Sc",2=>"M.Com",3=>"MBA/PGDM",4=>"B.Com",5=>"B.A.",6=>"BBA",7=>"BE/B.Tech",8=>"B.Sc",9=>"Others",10=>"Diploma",11=>"BCA",12=>"MA",13=>"B.Pharm",14=>"Doctorate(Phd)",15=>"12th",16=>"ME/M.Tech",17=>"MCA/PGDCA",18=>"ML/LLM",19=>"MBBS",20=>"BDS",21=>"MDS",22=>"BVSC",23=>"CS",24=>"CA",25=>"M.Ed",26=>"Aviation",27=>"M.Pharm",28=>"B.Ed",29=>"MD/MS",30=>"ICWA"}.invert.with_indifferent_access
MAX_RECORDS_PER_PAGE = 1000
PER_PAGE_OPTIONS = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
DEFAULT_RECORDS_PER_PAGE = 100