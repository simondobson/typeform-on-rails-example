class QuizsController < ApplicationController
    def new
      #Controller action for GET /quizs/new
    end

    def index
      #Controller action for GET /quizs/
      @quizzes = Quiz.all

      @pineapples = ((Quiz.where(pineapple: true).count.to_f / Quiz.all.count.to_f) * 100).round
        
      @tarantino = Quiz.all.group(:tarantino).count
      
      @messi = Quiz.average(:messi).round(2)

      @weekday = Quiz.all.group(:weekday).count

      @words = Quiz.all.sample(10)
    end

    def edit
      #Controller action for GET /quizs/:id/edit
    end

    def show
      #Controller action for GET /quizs/:id
    end

    def update
      #Controller action for PUT /quizs/:id
      #Controller action for PATCH /quizs/:id
    end

    def destroy
      #Controller action for DELETE /quizs/:id
    end

    def create
      #Controller action for POST /quizs/

      if params[:event_type] == 'form_response'
        tarantino, pineapple, messi, fav_word, weekday = nil

        answers = params[:form_response][:answers]
        answers.each do |answer|
          case answer[:field][:id]
            when 'cwMuUJKVbakz'
              tarantino = answer[:choice][:label]
            when 'oVyoZqH0Lfls'
              pineapple = answer[:boolean]
            when 'XZ8PDna8VTOd'
              messi = answer[:number]
            when 'Jt6KqFnOhWRL'
              fav_word = answer[:text]
            when 'lAxejTs1RYkh'
              weekday = answer[:choice][:label]
          end
        end

        @quiz = Quiz.new(tarantino: tarantino, pineapple: pineapple, messi: messi, fav_word: fav_word, weekday: weekday)
        @quiz.save
      end

    end
  end