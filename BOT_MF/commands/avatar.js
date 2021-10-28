const { SlashCommandBuilder } = require('@discordjs/builders')

module.exports = {
    data: new SlashCommandBuilder()
        .setName('avatar')
        .setDescription('Output avatar from user')
        .addUserOption(option => option.setName('objective').setDescription('Usuario cuyo avatar quieres ver')),
    async execute(interaction) {
        return console.log(interaction)
        const user = interaction.options.getUser()
    }
}