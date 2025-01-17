class JsTemplate {
  static String mainJsTemplate = '''
;(function () {
  const files = []

  function loadChunkScript(url) {
    return new Promise((resolve, reject) => {
      const xhr = new XMLHttpRequest()
      xhr.open('get', url, true)
      xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
          if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
            resolve(xhr.responseText)
          }
        }
      }
      xhr.onerror = reject
      xhr.ontimeout = reject
      xhr.send()
    })
  }

  let baseHref = window.location.origin
  const promises = files.map(key => `\${baseHref}/\${key}`).map(loadChunkScript)
  Promise.all(promises)
    .then(values => {
      console.log(values)
      const contents = values.join('')
      const script = document.createElement('script')
      script.text = contents
      script.type = 'text/javascript'
      document.body.appendChild(script)
    })
    .catch(e => {
      console.log(e)
    })
})()
''';
}
