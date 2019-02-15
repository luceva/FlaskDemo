# http://flask.pocoo.org/docs/1.0/testing/

import os
import pytest

from app.main import app
import flask

# This will get called before every test and can be used to set up a testing DB
@pytest.fixture
def client():
    client = app.test_client()
    yield client


def test_title(client):
    """Verify the title"""
    rv = client.get('/')
    assert b'Welcome to high/low game' in rv.data

def test_multiplication_GET(client):
    """Verify multiplication works"""
    rv = client.get('/guess?b=50')
    assert b'50' in rv.data
