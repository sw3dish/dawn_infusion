import React from "react"
import PropTypes from "prop-types"

const Select = ({selection, items, onChange}) => (
  <select onChange={onChange} defaultValue={selection}>
    <option value="">Select a story</option>
    {items.map((item) => (
      <option
        value={item.value}
        key={item.value}
      >{item.label}</option>
    ))}
  </select>
);

class MultiSelect extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      selections: this.props.selections,
    };

    this.addSelection = this.addSelection.bind(this);
    this.addSelect = this.addSelect.bind(this);
  }

  addSelection(e) {
    const selectedItem = this.props.items.filter((item) => item.value == e.target.value)[0];
    if (!state.selections.includes(selectedItem)) {
      this.setState((state) => {
        const selections = state.selections.filter(selection => selection.value != '');
        return {
          selections: [
            selectedItem,
            ...selections,
          ]
        }
      });
    }
  }

  addSelect(e) {
    e.preventDefault();
    this.setState((state) => ({
      selections: [
        '',
        ...state.selections,
      ],
    }));
  }

  render() {
    const { selections } = this.state;
    const { items, id, name } = this.props;
    const selectionIds = selections.filter(selection => selection !== '');
    console.log(selectionIds);
    return (
      <div>
        { selections.map((selection) => (
          <div key={selection.value}>
            <Select
              selection={selection}
              items={items}
              onChange={this.addSelection}
            />
          </div>
        ))}
        <div>
          <button
            onClick={this.addSelect}
          >
            Add another
          </button>
        </div>
        {/* This select is the select that is sent to Rails back-end */}
        <select
          name={name}
          id={id}
          value={selectionIds}
          hidden
          readOnly
          multiple
        >
          {items.map((item) => (
            <option
              value={item.value}
              key={item.value}
            >{item.label}</option>
          ))}
        </select>
      </div>
    );
  }
}

export default MultiSelect
