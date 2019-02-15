import os


from flask import Flask, request, redirect, render_template, session, url_for, g
import random

app = Flask(__name__)
app.config.from_mapping(SECRET_KEY='devIAm')  # Needed for session tracking
  # Note flask does CLIENT session data storage!  Watch data sizes!

@app.route('/')
def index():
  session['randN'] = random.randint(0,100)
  print(session['randN'])
  answer = " "
  session['times'] = 0
  attempt = "attempts"
  t = {'b': 0}
  if 'b' in request.args:
    t['b'] = request.args.get('b')
  return render_template('index.html', t = t, answer = answer, times = session['times'], attempt = attempt)

@app.route('/guess', methods=['GET'])
def calculate():
  t = {'b': 0}
  attempt = " "
  if 'b' in request.args:
    t['b'] = request.args.get('b')
    if session['randN'] == int(t['b']):
      answer = "Your answer is correct, and it took you"
    elif session['randN'] > int(t['b']):
      answer="Your answer is too low, and so far you used"
    else:
      answer="Your answer is too high, and so far you used"
  session['times'] += 1

  if session['times'] == 1:
    attempt = "attempt"
  else:
    attempt = "attempts"

  return render_template('index.html', t = t, answer = answer, times = session['times'], attempt = attempt) # Send t to the template

@app.route('/logout')
def logout():
  session.clear()
  return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')  # Enable on all devices so Docker works!
