# ask user for loan amount
# ask user for the annual percentage rate (APR). Will be a percentage
# convert the percentage into a float
# ask user for the duration of the loan (years).
# perform operation on the information given
# convert APR to a monthly interest rate
# calcualte loan duration in months
# output results
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num .to_i() != 0
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def valid_apr?(input)
  integer?(input) || float?(input)
end

prompt("Welcome to the mortgage calculator.")
prompt("-----------------------------------")

loop do
  loan_amount = ''
  loop do
    prompt("Please enter your desired loan amount.")
    loan_amount = Kernel.gets().chomp()

    if valid_number?(loan_amount)
      break
    else
      prompt("Hmm... that doesnt look like a valid number")
    end
  end
  prompt("Thanks. Your desired loan amount is $#{loan_amount.to_s.reverse.scan(/\d{1,3}/).join(',').reverse}
        dollars.")

  apr = ''
  loop do
    prompt("Please enter the annual percentage rate of the loan.")
    prompt("(for example: 5 for 5% or 2.5 for 2.5%)")

    apr = Kernel.gets().chomp()

    if valid_apr?(apr)
      break
    else
      prompt("Hmm... that doesnt look like a valid number")
    end
  end
  prompt("Excellent. Your APR rate is #{apr}%")

  duration_years = ''
  loop do
    prompt("Last question. What is the duration of the loan in years?")
    duration_years = Kernel.gets().chomp()

    if valid_number?(duration_years)
      break
    else
      prompt("Hmm... that doesnt look like a valid number of years.")
    end
  end
  prompt("Okay. The duration of the loan is #{duration_years} years.")

  annual_rate = apr.to_f() / 100
  monthly_rate = annual_rate / 12
  duration_months = duration_years.to_i() * 12

  payment = loan_amount.to_f() *
            (monthly_rate /
            (1 - (1 + monthly_rate)**-duration_months.to_i()))
  payment = payment.round(2)

  prompt("Your monthly payment will be #{payment}.")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for using the Mortgage Calculator. Goodbye!")
