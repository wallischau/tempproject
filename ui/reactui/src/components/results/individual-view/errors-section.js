import React from 'react' 


class ErrorsDisplay extends React.Component {
  constructor(props) {
    super(props)

    this.state = {
      show: false
    }
  }

  render () {
    const { show } = this.state
    const { errors } = this.props
    return (
      <section className="results-section results-errors">
        <h2 onClick={() => this.setState({ show: !show })} style={{ cursor: 'pointer' }}>
          Errors per Test Run ({Object.keys(errors).length} total) {show ? '-' : '+'}
        </h2>
        {
          show &&
          <div className="results-inner-section">
            {
              Object.entries(errors).map(([test_name, errors_per_test]) => {
                return <div key={test_name}>
                    {test_name}:
                    <ol>
                      {errors_per_test.map(err => <li key={err}>{err}</li>)}
                    </ol>
                  </div>
              })
            }
          </div>
        }
      </section>
    )
  }
}


export default ErrorsDisplay
