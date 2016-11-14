def book(text)
  puts("Actions for book #{text}")
end

def product(text)
  puts("Products #{text}")
end
def packing_slip(text)
  puts("Printing packing slip for #{text}")
end
def activate()
  puts("Setting up membership")
end
def email(email)
  puts("Emailing customer #{email}")
end
def pay(commision)
  puts("Customer owns #{commision}")
end
load 'rules.qm'
