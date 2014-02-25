class Admin::ActorsController < Admin::ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      redirect_to admin_actor_url(@actor), notice: "Ведущий добавлен"
    else
      render :new, notice: "Не получилось, бро"
    end
  end

  def edit
  end
  
  def show
    @actor = Actor.find(params[:id])
  end
  
  def update
  end

  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to admin_actors_url, notice: "Ведущий удален"
  end
  
  def avatar
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(avatar_id: params['photo_id'])
      redirect_to admin_actor_path(@actor), notice: 'ок'
    else
      redirect_to admin_actor_path(@actor), notice: 'не ок'
    end
  end
end
