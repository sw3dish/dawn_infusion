import React from 'react';


class Lyra extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      storyInLyra: false,
    }

    this.postToLyra = this.postToLyra.bind(this);
  }

  // componentDidMount() {
  //   const { noun, id } = this.props
  //   fetch(`http://localhost:3000/${noun}/${id}`)
  //     .then((response) => {
  //       console.log(response)
  //     })
  // }

  postToLyra(e) {
    e.preventDefault();

    const {noun, id} = this.props;
    const csrfToken = document.getElementsByTagName('meta').item(name='csrf-token');

    fetch(`http://localhost:3000/${noun}/${id}/lyra`, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': csrfToken,
      }
    }).then(() => {
      console.log('posted');
    });
  }

  render() {
    return (
      <div>
        <button onClick={this.postToLyra}>
          Post to Lyra
        </button>
      </div>
    )
  }
}

export default Lyra;

// <%= react_component('Lyra', {noun: 'newsletters', id: @newsletter.id }) %>
