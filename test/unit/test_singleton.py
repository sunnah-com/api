from hadith_api.chalicelib.singleton import Singleton

def test_Singleton_instance():
    class MockClass():
     __metaclass__ = Singleton
       
    a,b = MockClass(), MockClass()
    assert a is b
