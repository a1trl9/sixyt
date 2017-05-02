function buildParseError(info) {
  return {
    type: 'parseError',
    info,
  }
}

export default buildParseError
