class MysitemapController < ApplicationController
  layout nil
  def index
    headers['Content-Type'] = 'application/xml'
  end
end