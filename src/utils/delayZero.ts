let channel: MessageChannel
export const delayZero = () => {
  channel ??= new MessageChannel()
  return new Promise((r) => {
    channel.port1.onmessage = r
    channel.port2.postMessage('')
  })
}
