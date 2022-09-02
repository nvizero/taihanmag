require 'json'
require 'rubygems'
require 'nokogiri'

class HomeController < ApplicationController

  before_action :set_footer , :allow_iframe , :set_page_left_pic , :set_notice
  after_action :allow_iframe
  helper_method :sort_column, :sort_direction

  layout 'jeams'


  def aphp

    list_all_files = "php --version"
    output = `#{list_all_files}`
    parsed_data = Nokogiri::HTML.fragment(output)
    render :html =>"#{output}"

  end

  def index
    @page_title = 'page_title'
    @cates = Cate.where(:flag => 1)
    @annos = Announce.where(:flag => 1)

    @buttom_left  = Footer.find(32)
    @buttom_right = Footer.find(33)
  end


  # def get_menu
  #   render "get_menu", layout: false
  # end

  def magnetism

  end

  def magnetism2

  end

  def index2

  end




  def application_main
    @cates = Cate.where.not(:id =>1).order("level desc")
  end



  def application_sub
    application_id = params[:id]
    # @cate = Cate.find(cate_id)
    @msgs = Msg.where(:cate_id => application_id)
  end



  def get_lng
    lng=I18n.locale
    render :json=>  "#{lng.to_s}".to_json
  end

  def application

    id    = params[:id]
    @msg  = Msg.find(id)

  end


  def solutions_main
    @footers = Footer.order("sort desc")
  end

  def solutions
    id = params[:id]
    @footer = Footer.find(id)
  end

  def glossary
    @glossary = Footer.find(30)
  end

  # def about
  #   @about = Footer.find(30)
  # end

  def company
    @company = Footer.find(31)
  end

  def contact
    @about = Footer.find(32)
  end




  def  contact_submit

    name    =  params[:name]
    email   =  params[:email]
    phone   =  params[:phone]
    title   =  params[:title]
    content =  params[:content]

    if !name.empty? && !email.empty? && !phone.empty? && !title.empty? && !content.empty?
      UserMailer.report_class( name,email,phone,title,content  ).deliver_now
      redirect_to action: "index" , notice: 'email  was send '
    else
      redirect_to action: "contact" , notice: 'name email phone title message must be insert'
    end



  end




  def annos
    @annos = Announce.all
  end

  def anno
    @anno=Announce.find(params[:id])
  end

  def safety_advice
    @saves = Safe.all
  end


  def download
    @resumes = Resume.order(sort_column + " " + sort_direction).page(params[:page]).limit(10)
  end


  def set_footer
    @cates = Cate.all
    @footer = Footer.first
    @active_flag = "index"
  end

  def set_page_left_pic

    @left_pic =  Event.where(:cate =>2).order("RAND()").first
  end

  def routing_error(error = 'Routing error', status = :not_found, exception=nil)
      render_exception(404, "Routing Error", exception)
  end

  def action_missing(m, *args, &block)
    Rails.logger.error(m)
    redirect_to '/*path'
  end


  def sort_column
    Msg.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
    response.headers["X-FRAME-OPTIONS"] = "ALLOW-FROM https://www.youtube.com/"

  end

  def  set_notice
    @notice = params[:notice]
  end


end
