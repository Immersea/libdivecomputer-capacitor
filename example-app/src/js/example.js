import { libdc } from 'lib-dive-computer-plugin';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    libdc.echo({ value: inputValue })
}
