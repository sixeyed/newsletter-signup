using System;
using NATS.Client;
using SignUp.Messaging.Messages;

namespace SignUp.Messaging
{
    public static class MessageQueue
    {

        public static void Publish<TMessage>(TMessage message)
            where TMessage : Message
        {   
            using (var connection = CreateConnection())
            {
                var data = MessageHelper.ToData(message);
                connection.Publish(message.Subject, data);
            }
        }

        public static IConnection CreateConnection()
        {
            var options = ConnectionFactory.GetDefaultOptions();
            options.Url = Config.MessageQueueUrl;
            options.DisconnectedEventHandler += HandleDisconnect;
            options.AsyncErrorEventHandler += HandleError;

            return new ConnectionFactory().CreateConnection(options);
        }

        private static void HandleDisconnect(object sender, ConnEventArgs e)
        {
            throw new Exception("NATS disconnected");
        }

        private static void HandleError(object sender, ErrEventArgs e)
        {
            throw new Exception("NATS errored");
        }
    }
}
