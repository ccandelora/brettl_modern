class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [ :edit, :update, :destroy ]

  # GET /app/notes/new
  def new
    @note = Note.new(reservation_week_id: params[:reservation_week_id])
    authorize @note
  end

  # POST /app/notes
  def create
    @note = Note.new(note_params)
    @note.user = current_user
    authorize @note

    if @note.save
      redirect_to app_reservation_week_path(date: @note.reservation_week.week_start), notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /app/notes/:id/edit
  def edit
    authorize @note
  end

  # PATCH/PUT /app/notes/:id
  def update
    authorize @note
    if @note.update(note_params)
      redirect_to app_reservation_week_path(date: @note.reservation_week.week_start), notice: "Note was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /app/notes/:id
  def destroy
    authorize @note
    week_start_date = @note.reservation_week.week_start
    @note.destroy
    redirect_to app_reservation_week_path(date: week_start_date), notice: "Note was successfully deleted."
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :reservation_week_id)
  end
end
