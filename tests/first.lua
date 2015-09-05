describe('first', function()
  it('produces an error if its parent errors', function()
    local observable = Rx.Observable.fromValue(''):map(function(x) return x() end)
    expect(observable.subscribe).to.fail()
    expect(observable:first().subscribe).to.fail()
  end)

  it('produces no elements if its parent produces no elements', function()
    local observable = Rx.Observable.create(function(observer) return observer:onComplete() end):first()
    expect(observable).to.produce({})
  end)

  it('produces the first element of its parent and immediately completes', function()
    local observable = Rx.Observable.fromRange(5):first()
    expect(observable).to.produce(1)
  end)
end)

