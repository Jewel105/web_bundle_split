class MainDartJs {
  static String script = '''
var file = [
  'main.dart.1.34cd5452.js',
  'main.dart.2.4a736032.js',
  'main.dart.3.529e9e7e.js',
  'main.dart.4.e1d4eacd.js',
  'main.dart.5.664531f5.js',
  'main.dart.6.65343529.js',
  'main.dart.7.a59f262e.js',
  'main.dart.8.49a74a50.js',
  'main.dart.9.8b0f953b.js',
]

function _createScriptTag(e, r) {
  let t = document.createElement('script')
  ;(t.type = 'application/javascript'), r && (t.nonce = r)
  let i = e
  return this._ttPolicy != null && (i = this._ttPolicy.createScriptURL(e)), (t.src = i), t
}

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

let retryCount = 0
let baseHref = 'http://127.0.0.1:8080/'
const promises = file.map(key => `\${baseHref}\${key}`).map(loadChunkScript)
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
''';
}
