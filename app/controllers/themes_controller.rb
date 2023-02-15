class ThemesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_blog, only: [:show, :edit, :update]
    def index
      @themes = Theme.all
    end

    def new
      @theme = Theme.new
    end

    def create
     @theme = Theme.new(theme_params)
       if @theme.save
         redirect_to themes_path, notice: "募集を開始しました！"
       else
         render :new
       end
    end

    def show
     
    end

    def update
     
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: "ブログを編集しました！"
      else
        render :edit
      end
    end

    


    def edit
      
    end

    def destroy
        @blog.destroy
    end

    private

    def theme_params
        params.require(:theme).permit(:title,:content,:reword,:img)
    end

    def set_blog
        @theme = Theme.find(params[:id])
    end

end
