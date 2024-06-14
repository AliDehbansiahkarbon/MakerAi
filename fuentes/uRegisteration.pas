unit uRegisteration;

interface
uses
  System.Classes,
   uAiOpenAssistant, uOpenAi, uAiGroq, uAiOllama, uAiOpenChat,
   uAiToolFunctions, uAiAnthropic, uAiPrompts, uAiVectors,
   uAGraph, uAiGemini;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('MakerAI', [TAiPrompts]);
  RegisterComponents('MakerAI', [TAiFunctions]);
  RegisterComponents('MakerAI', [TAiEmbeddings, TAiVision, TAiAudio, TAiImages]);
  RegisterComponents('MakerAI', [TAiOpenAssistant]);
  RegisterComponents('MakerAI', [TAIGraph, TAIGraphNode, TAIGraphLink]);
  RegisterComponents('MakerAI', [TAiOllamaChat, TAiOlamalEmbeddings]);
  RegisterComponents('MakerAI', [TAiGroqChat]);
  RegisterComponents('MakerAI', [TAiOpenChat, TAiChatConfig]);
  RegisterComponents('MakerAI', [TAiClaudeChat]);
  RegisterComponents('MakerAI', [TAiRagChat, TAiDataVec]);
  RegisterComponents('MakerAI', [TAiGeminiChat]);
end;

end.
