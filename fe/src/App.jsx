import { useState, useEffect } from 'react'
import './App.css'

function App() {
  // 材料数据
  const [question, setQuestion] = useState('');
  const [materials, setMaterials] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const designerId = 1;
  const sessionId = '1'; // 默认会话ID

  const fetchRecommendations = async () => {
    setIsLoading(true); // 开始加载
    try {
      const response = await fetch(
        `http://localhost:8080/ai/recommendMaterial?designerId=${designerId}&sessionId=${encodeURIComponent(sessionId)}&question=${encodeURIComponent(question)}`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        }
      );


      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`HTTP error! status: ${response.status}, message: ${errorText}`);
      }

      const data = await response.json();
      console.log('Raw data from API:', data);
      // 检查data是否为对象且包含materials属性，否则假设data本身就是材料数组
      if (data && typeof data === 'object' && Array.isArray(data.data)) {
        setMaterials(data.data);
      } else if (Array.isArray(data)) {
        setMaterials(data);
      } else {
        console.warn('Unexpected data format from API:', data);
        setMaterials([]);
      }
      console.log('Materials state after update:', materials);
    } catch (error) {
      console.error('Error fetching recommendations:', error.message);
      setMaterials([]); // 请求失败时清空材料数据，确保materials始终是数组
    } finally {
      setIsLoading(false); // 结束加载
    }
  };

  // 初始加载或问题变化时触发
  useEffect(() => {
    // 可以在这里设置一个默认问题或者在用户输入后才触发
    // fetchRecommendations(); // 如果需要页面加载时就请求，可以取消注释
  }, []); // 空数组表示只在组件挂载时运行一次

  const handleSend = () => {
    if (question.trim()) {
      fetchRecommendations();
    }
  };

  return (
    <div className="app-container">
      {/* 左侧边栏 */}
      <div className="left-sidebar">
        <div className="logo-container">
          <div className="logo">AI</div>
        </div>
        <div className="sidebar-menu">
          <div className="menu-item active">
            <span className="icon">📄</span>
          </div>
          <div className="menu-item">
            <span className="icon">💬</span>
          </div>
          <div className="menu-item">
            <span className="icon">❤️</span>
          </div>
        </div>
        <div className="sidebar-footer">
          <div className="menu-item">
            <span className="icon">⬅️</span>
          </div>
          <div className="menu-item">
            <span className="icon">👤</span>
          </div>
        </div>
      </div>

      {/* 中间内容区 */}
      <div className="main-content">
        <div className="chat-header">
          <h2>海岛民居建筑改造材料推荐</h2>
        </div>
        
        <div className="chat-messages">
          {materials.length > 0 && (
            <div className="message ai-message">
              <div className="ai-avatar">AI</div>
              <div className="message-content">
                <div className="materials-grid">
                {materials.map((material, index) => (
                  <div key={index} className="material-card">

                    <h3>{material.name}</h3>
                    <p>Category: {material.category}</p>
                    <p>Texture: {material.texture}</p>
                    <p>Formula: {material.formula}</p>
                    <p>Sustainability Score: {material.sustainabilityScore}</p>
                  </div>
                ))}
                </div>
              </div>
            </div>
          )}
          
          <div className="chat-input">
            <div className="input-container">
              <input 
                type="text" 
                placeholder="Tell CircPe your design idea" 
                value={question}
                onChange={(e) => setQuestion(e.target.value)}
                onKeyPress={(e) => {
                  if (e.key === 'Enter') {
                    handleSend();
                  }
                }}
              />
              <button 
                className="send-button"
                onClick={handleSend}
                disabled={isLoading}
              >
                {isLoading ? '正在生成...' : '确认 & 获取!'}
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* 右侧边栏 */}
      <div className="right-sidebar">
        <div className="color-palette">
          <div className="color-item blue"></div>
          <div className="color-item brown"></div>
          <div className="color-item orange"></div>
        </div>
      </div>
    </div>
  )
}
export default App;
