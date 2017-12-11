/**
 * The preload script needs to stay in regular ole JavaScript, because it is
 * the point of entry for electron-compile.
 */

require('../stat-cache');

const { init } = require('electron-compile');
const { assignIn } = require('lodash');
const path = require('path');

const { isPrebuilt } = require('../utils/process-helpers');
const profiler = require('../utils/profiler.js');

if (profiler.shouldProfile()) profiler.startProfiling();

process.on('uncaughtException', (e) => console.error(e));

/**
 * Patch Node.js globals back in, refer to
 * https://electron.atom.io/docs/api/process/#event-loaded.
 */
const processRef = window.process;
process.once('loaded', () => {
  window.process = processRef;
});

/**
 * loadSettings are just the command-line arguments we're concerned with, in
 * this case developer vs production mode.
 */
const loadSettings = window.loadSettings = assignIn({},
  require('electron').remote.getGlobal('loadSettings'),
  { windowType: 'webapp' }
);

const resourcePath = path.join(__dirname, '..', '..');
const mainModule = require.resolve('../ssb/main.ts');
const isDevMode = loadSettings.devMode && isPrebuilt();

init(resourcePath, mainModule, !isDevMode);
