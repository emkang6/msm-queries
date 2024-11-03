
class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest_index


    matching_dir = Director.where.not({ :dob => nil}).order({ :dob => :desc})
    @the_youngest_director = matching_dir.at(0)

    render({ :template => "director_templates/youngest"})
  end

  def eldest_index
    matching_dir_2 = Director.where.not({ :dob => nil}).order({ :dob => :asc})
    @the_eldest_director = matching_dir_2.at(0)

    render({ :template => "director_templates/eldest"})
  end

end
