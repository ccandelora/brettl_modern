class ReservationWeeksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation_week, only: %i[ show edit update destroy ]

  # GET /reservation_weeks or /reservation_weeks.json
  def index
    @reservation_weeks = ReservationWeek.all.order(res_date: :desc)
  end

  # GET /reservation_weeks/1 or /reservation_weeks/1.json
  def show
    @reservations = @reservation_week.reservations.includes(:user)
  end

  # GET /reservation_weeks/new
  def new
    @reservation_week = ReservationWeek.new
  end

  # GET /reservation_weeks/1/edit
  def edit
  end

  # POST /reservation_weeks or /reservation_weeks.json
  def create
    @reservation_week = ReservationWeek.new(reservation_week_params)

    respond_to do |format|
      if @reservation_week.save
        format.html { redirect_to @reservation_week, notice: "Reservation week was successfully created." }
        format.json { render :show, status: :created, location: @reservation_week }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_weeks/1 or /reservation_weeks/1.json
  def update
    respond_to do |format|
      if @reservation_week.update(reservation_week_params)
        format.html { redirect_to @reservation_week, notice: "Reservation week was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation_week }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation_week.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_weeks/1 or /reservation_weeks/1.json
  def destroy
    @reservation_week.destroy!

    respond_to do |format|
      format.html { redirect_to reservation_weeks_path, status: :see_other, notice: "Reservation week was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_week
      if params[:id]
        begin
          @reservation_week = ReservationWeek.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          redirect_to reservation_weeks_path, alert: "Reservation week not found."
          nil
        end
      elsif params[:date]
        # Find by date for app routes with error handling
        begin
          date = Date.parse(params[:date])
          @reservation_week = ReservationWeek.find_by(res_date: date)
          # If no week exists for this date, create one
          @reservation_week ||= ReservationWeek.create!(res_date: date)
        rescue Date::Error, ArgumentError
          # Invalid date format, redirect to current week
          redirect_to reservation_weeks_path, alert: "Invalid date format. Redirected to current weeks list."
          nil
        end
      else
        # Default to current week for app routes without date
        # Week starts on Wednesday
        current_week_start = Date.current.beginning_of_week(:wednesday)
        @reservation_week = ReservationWeek.find_by(res_date: current_week_start)
        # If no week exists for current week, create one
        @reservation_week ||= ReservationWeek.create!(res_date: current_week_start)
      end
    end

    # Only allow a list of trusted parameters through.
    def reservation_week_params
      params.expect(reservation_week: [ :note, :res_date ])
    end
end
