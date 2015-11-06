class Postman
  @letter = Letter.for_send

  def self.deliver(letter = @letter)
    LetterMailer.send_mail(letter).deliver_now
    letter.update status: :sent
  end
end
