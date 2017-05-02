import buildParseError from './error'

function parseHeadline(tokenList, start) {
  const end = tokenList.length
  let valueStart = tokenList.findIndex(token => token !== '#')
  if (typeof valueStart === 'undefined') {
    throw buildParseError(`Invalid headline starts at ${start}`)
  }
  // We only omit the first space
  if (tokenList[valueStart] === ' ') {
    valueStart += 1
  }
  const next = tokenList
    .slice(valueStart)
    .findIndex((token, index) => token === '\n' ||
    index === end) + valueStart

  return {
    next,
    node: {
      type: 'headline',
      headLevel: valueStart - start,
      value: tokenList.slice(valueStart, next).join(''),
    },
  }
}

function parse(tokenList, start = 0) {
  return parseHeadline(tokenList, start)
}

export default parse
